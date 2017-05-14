package ru.kpfu.itis.model;

import ru.kpfu.itis.model.enums.OrderType;


import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "orders")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "order_id", unique = true, nullable = false)
    private long id;
    @OneToMany(mappedBy = "order", fetch = FetchType.LAZY)
    List<ProductInOrder> productInOrders;
    @OneToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;
    @Enumerated(EnumType.STRING)
    private OrderType typeOrder;


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public List<ProductInOrder> getProductInOrders() {
        return productInOrders;
    }

    public void setProductInOrders(List<ProductInOrder> productInOrders) {
        this.productInOrders = productInOrders;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public OrderType getTypeOrder() {
        return typeOrder;
    }

    public void setTypeOrder(OrderType typeOrder) {
        this.typeOrder = typeOrder;
    }
}
