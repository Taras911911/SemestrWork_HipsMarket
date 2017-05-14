package ru.kpfu.itis.util.validators;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import ru.kpfu.itis.form.AddStockForm;

public class ValidatorAddStockForm implements Validator {
    @Override
    public boolean supports(Class<?> aClass) {
        return false;
    }

    @Override
    public void validate(Object o, Errors errors) {
        AddStockForm addStockForm = (AddStockForm) o;
        if (addStockForm.getCity() == null || addStockForm.getCity().isEmpty()) {
            errors.rejectValue("city", "", "Поле не может быть пустым");
        }
        if (addStockForm.getStreet() == null || addStockForm.getStreet().isEmpty()) {
            errors.rejectValue("street", "", "Поле не может быть пустым");
        }
    }
}
