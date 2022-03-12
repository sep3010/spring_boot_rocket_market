package edu.kosmo.krm.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import edu.kosmo.krm.page.Criteria;
import edu.kosmo.krm.page.CriteriaP;
import edu.kosmo.krm.page.PagePVO;
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
		view.addObject("productList", productService.getAdminProductList(criteria));
		int total = productService.getProductTotal();
		view.addObject("pageMaker", new PageVO(criteria, total));

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
	
	/*유빈*/	
	// ============== 상품 목록 페이지로 이동 ===================
	//신상품
	@GetMapping("/newProduct")
	public ModelAndView newProduct(CriteriaP criteriaP, ModelAndView view) {
		log.info("newProduct()..");
		
		view.addObject("pageName","newProduct");
		view.addObject("name", "신상품");
		view.addObject("productList", productService.getNewProductList(criteriaP));
		int total = productService.getProductTotal();
		view.addObject("productTotal", total); //상품총개수
		view.addObject("pageMaker", new PagePVO(criteriaP, total));
		
		view.setViewName("/product/list");
		return view;
	}
	//베스트상품
	@GetMapping("/bestProduct")
	public ModelAndView bestProduct(CriteriaP criteriaP, ModelAndView view) {
		log.info("bestProduct()..");

		view.addObject("pageName","bestProduct");
		view.addObject("name", "베스트상품");
		view.addObject("productList", productService.getBestProductList(criteriaP));
		int total = productService.getBestProductTotal();
		view.addObject("productTotal", total); //상품총개수
		view.addObject("pageMaker", new PagePVO(criteriaP, total));
		
		view.setViewName("/product/list");
		return view;
	}

	//할인상품
	@GetMapping("/saleProduct")
	public ModelAndView saleProduct(CriteriaP criteriaP, ModelAndView view) {
		log.info("saleProduct()..");

		view.addObject("pageName","saleProduct");
		view.addObject("name", "할인상품");
		view.addObject("productList", productService.getSaleProductList(criteriaP));
		int total = productService.getSaleProductTotal();
		view.addObject("productTotal", total); //상품총개수
		view.addObject("pageMaker", new PagePVO(criteriaP, total));
		
		view.setViewName("/product/list");
		return view;
	}
	
	//정기배송상품
	@GetMapping("/subscribeProduct")
	public ModelAndView subscribeProduct(CriteriaP criteriaP, ModelAndView view) {
		log.info("subscribeProduct()..");

		view.addObject("pageName","subscribeProduct");
		view.addObject("name", "정기배송상품");
		view.addObject("productList", productService.getSubscribeProductList(criteriaP));
		int total = productService.getSubscribeProductTotal();
		view.addObject("productTotal", total); //상품총개수
		view.addObject("pageMaker", new PagePVO(criteriaP, total));
		
		view.setViewName("/product/list");
		return view;
	}
	
	//카테고리별상품
	@GetMapping("/categoryProduct/{etype}")
	public ModelAndView categoryProduct(CriteriaP criteriaP, ModelAndView view) {
		log.info("categoryProduct().." + criteriaP);
		
		String type ="";
		String etype = criteriaP.getEtype();
		log.info("etype : " +etype);

		if(etype.equals("vegetable")) {
			type = "채소/과일";
		}
		else if(etype.equals("meat")) {type = "육류";}
		else if(etype.equals("side")) {type = "국/반찬";}
		else if(etype.equals("snack")) {type = "간식/과자";}
		else if(etype.equals("dairy")) {type = "유제품";}
		else if(etype.equals("instant")) {type = "즉석식품";}
		
		criteriaP.setEtype(type);

		view.addObject("pageName","categoryProduct/"+etype);//페이징용url설정
		view.addObject("name", type);//카테고리명
		view.addObject("productList", productService.getCategoryProductList(criteriaP));
		int total = productService.getCategoryProductTotal(type);
		view.addObject("productTotal", total); //상품총개수
		view.addObject("pageMaker", new PagePVO(criteriaP, total));
		
		view.setViewName("/product/categoryList");
		return view;
	}
	

}
