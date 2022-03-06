package edu.kosmo.krm.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.krm.mapper.ProductMapper;
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
		
		// 상품메인 이미지 목록
		view.addObject("mainImages", productService.getProductMainImage());


		view.setViewName("/admin/productManagement");
		return view;
	}

	// 상품 재고 수정하기
	@PostMapping("/admin/productManagement/stock")
	public ProductVO stock_update(@RequestBody ProductVO productVO) {		
		log.info("stock_update.. productVO" + productVO);
		productService.updateProductStock(productVO);
		productVO = productService.getProduct(productVO.getId());

		return productVO;
	}
	
	/*소은*/	
	// 상품 등록페이지로 이동
	@GetMapping("/admin/addProduct")
	public ModelAndView addProduct(ModelAndView view) {
		log.info("addProduct()..");

		view.setViewName("/admin/addProduct");
		return view;
	}
	
	// 상품과 이미지 등록하기
	@PostMapping("/admin/insertProduct")
	public ModelAndView insertProduct(ModelAndView view, HttpServletRequest request,
			ProductVO productVO, @RequestParam("main") MultipartFile main,
			@RequestParam("info") MultipartFile info, 
			@RequestParam("detail") MultipartFile detail) {
		log.info("insertProduct()..");
		log.info("productVO : " + productVO);
		
		Map<String, MultipartFile> files = new HashMap<>();
		
		files.put("main", main);
		files.put("info", info);
		files.put("detail", detail);
		
		// 각 팀원들의 프로젝트 폴더 경로 설정(상대적 경로)을 위한 처리.
		String savePath = request.getSession().getServletContext()
							.getRealPath("/").concat("resources\\product-image");	
		
		log.info("savePath : " + savePath);
		
		productService.insertProductAndImage(productVO, files, savePath);
		view.setViewName("redirect:/admin/productManagement");
		
		return view;
	}
	

}
