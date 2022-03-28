package edu.kosmo.krm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import edu.kosmo.krm.vo.ProductSalesVO;
import edu.kosmo.krm.vo.SalesVO;

@Mapper
public interface SalesMapper {

	@Select("SELECT * FROM product_sales")
	List<ProductSalesVO> getProductSalesList();
	
	// 일별 매출
	List<SalesVO> getDailySales(@Param("year")int year, @Param("month")int month);
	
	// 월별 매출
	List<SalesVO> getMonthlySales(int year);
	
	// 연별 매출
	List<SalesVO> getYearlySales();

}
