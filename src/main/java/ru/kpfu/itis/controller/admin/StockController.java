package ru.kpfu.itis.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import ru.kpfu.itis.form.AddQuantityForm;
import ru.kpfu.itis.form.AddStockForm;
import ru.kpfu.itis.form.collateralForms.QuantityForm;
import ru.kpfu.itis.model.Stocktaking;
import ru.kpfu.itis.model.Stock;
import ru.kpfu.itis.service.ProductService;
import ru.kpfu.itis.service.StocktakingService;
import ru.kpfu.itis.service.StockService;
import ru.kpfu.itis.util.validators.ValidatorAddProductForm;
import ru.kpfu.itis.util.validators.ValidatorAddStockForm;

@Controller
@RequestMapping(value = "admin/stock")
public class StockController {

    @Autowired
    private ProductService productService;
    @Autowired
    private StockService stockService;
    @Autowired
    private StocktakingService stocktakingService;

    private ValidatorAddStockForm validatorAddStockForm = new ValidatorAddStockForm();

    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public String stocks(Model model) {
        model.addAttribute("stocks", stockService.getAll());
        return "list_stocks";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@RequestParam(value="id", required=true) Long id,
                         Model model) {
        for (Stocktaking stocktaking: stocktakingService.getAllByStockId(id)) {
            stocktakingService.delete(stocktaking.getId());
        }
        stockService.delete(id);
        model.addAttribute("id", id);
        return "redirect:/admin/stock/all";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String product_page(@PathVariable("id") long id, Model model) {
        model.addAttribute("stock", stockService.getById(id));
        model.addAttribute("stocktaking", stocktakingService.getAllByStockId(id));
        model.addAttribute("quantity", stocktakingService.getAllQuantityOnStock(stocktakingService.getAllByStockId(id)));
        model.addAttribute("products", productService.getByIdIn(stocktakingService.getIdsProducts(stocktakingService.getAllByStockId(id))));
        model.addAttribute("modify_quantity", new QuantityForm());
        return "stock_page";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add_stock(Model model){
        model.addAttribute("stock_form", new AddStockForm());
        return "add_stock";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add_stock(@ModelAttribute("stock_form") AddStockForm form, BindingResult result){
        validatorAddStockForm.validate(form, result);
        if (result.hasErrors()) {
            return "add_stock";
        } else {
            stockService.save(form);
            return "redirect:/admin/stock/all";
        }
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.POST)
    public String add_stock(@ModelAttribute("modify_quantity") QuantityForm form, @PathVariable("id") String id){
        Stocktaking stocktaking = stocktakingService.getById(form.getStocktaking());
        AddQuantityForm addQuantityForm = new AddQuantityForm();
        addQuantityForm.setStocktaking(stocktaking);
        addQuantityForm.setQuantity(form.getQuantity());
        stocktakingService.putQuantity(addQuantityForm);
        return "redirect:/admin/stock/" + id;
    }
}
