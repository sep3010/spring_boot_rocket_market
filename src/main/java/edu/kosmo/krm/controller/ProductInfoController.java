package edu.kosmo.krm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.service.ProductService;
import edu.kosmo.krm.vo.ProductVO;
import edu.kosmo.krm.page.PageVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class ProductInfoController {

	@Autowired
	private ProductService productService;

	// admin - 전체상품목록페이지
	@GetMapping("/admin/productManagement")
	public ModelAndView productManagement(Criteria criteria, ModelAndView view) {
		log.info("productManagement(Paging)..");

		// 전체상품목록
		view.addObject("productList", productService.getProductList(criteria));
		int total = productService.getProductTotal();
		view.addObject("pageMaker", new PageVO(criteria, total));

		view.setViewName("/admin/productManagement");
		return view;
	}


	@PostMapping("/admin/productManagement/stock")
	public ProductVO stock_update(@RequestBody ProductVO productVO) {		
		log.info("stock_update.. productVO" + productVO);
		productService.updateProductStock(productVO);
		productVO = productService.getProduct(productVO.getId());

		return productVO;
	}


}
