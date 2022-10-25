package ps17203.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import ps17203.entity.Product;

public interface ProductDAO extends JpaRepository<Product, Integer>{

	
	@Query(name = "findByKeyword")
	List<Product> findByKeyword(String keyword);
	
	@Query(value="SELECT * FROM Products WHERE CategoryId like ?1",nativeQuery = true)
	List<Product> findByCategoryId(String keyword);

}
