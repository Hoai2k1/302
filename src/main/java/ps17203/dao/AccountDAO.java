package ps17203.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import ps17203.entity.Account;
import ps17203.entity.Product;



public interface AccountDAO extends JpaRepository<Account, Integer>{
	



}
