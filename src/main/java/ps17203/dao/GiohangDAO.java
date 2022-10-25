package ps17203.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import ps17203.entity.Giohang;
import ps17203.entity.Product;

public interface GiohangDAO extends JpaRepository<Giohang, Integer>{

	
	@Query(value="DELETE FROM giohang WHERE name like ?1",nativeQuery = true)
	List<Product> deleteByName(String name);

}
