package ps17203.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import ps17203.entity.Order;



public interface OrderDAO extends JpaRepository<Order, Integer>{
}
