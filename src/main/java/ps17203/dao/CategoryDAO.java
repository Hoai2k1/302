package ps17203.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import ps17203.entity.Category;



public interface CategoryDAO extends JpaRepository<Category, String>{
	
}
