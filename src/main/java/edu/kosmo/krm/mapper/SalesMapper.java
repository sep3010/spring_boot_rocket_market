package edu.kosmo.krm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import edu.kosmo.krm.vo.ProductSalesVO;

@Mapper
public interface SalesMapper {

	@Select("SELECT * FROM product_sales")
	List<ProductSalesVO> getProductSalesList();
	

}
