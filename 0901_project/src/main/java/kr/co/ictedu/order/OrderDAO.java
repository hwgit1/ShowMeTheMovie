package kr.co.ictedu.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.product.ProductDTO;

@Repository
public class OrderDAO {

	@Autowired
	private SqlSession sqlSession;

	public int updateDeliveryAddrUsedDate( OrderMainDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.update("OrderMapper.updateDeliveryAddrUsedDate", dto);
		return successCount;
	}//updateDeliveryAddrUsedDate

	public int updateCreditCardUsedDate( OrderMainDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.update("OrderMapper.updateCreditCardUsedDate", dto);
		return successCount;
	}//updateCreditCardUsedDate

	public int deleteBasketByArray(String [] arr_basket_no) {
		int successCount = 0;
		successCount = sqlSession.delete("OrderMapper.deleteBasketByArray", arr_basket_no);
		return successCount;
	}//deleteBasketByArray

	public int insertBuyNowOrderDetail(OrderMainDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("OrderMapper.insertBuyNowOrderDetail", dto);
		return successCount;
	}//insertOrderDetail

	public int insertOrderDetail(OrderMainDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("OrderMapper.insertOrderDetail", dto);
		return successCount;
	}//insertOrderDetail

	public int insertOrderMain(OrderMainDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("OrderMapper.insertOrderMain", dto);
		return successCount;
	}//insertOrderMain

	public List<ProductDTO> buyNowOrderList(ProductDTO dto) {
		List<ProductDTO> list = null;
		list = sqlSession.selectList("OrderMapper.buyNowOrderList", dto);
		return list;
	}//buyNowOrderList

	public List<ProductDTO> orderList(String [] arr_basket_no) {
		List<ProductDTO> list = null;
		list = sqlSession.selectList("OrderMapper.orderList", arr_basket_no);
		return list;
	}//orderList

}//class
