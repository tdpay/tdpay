/**
 *
 */
package egovframework.example.cmmn.web;

import javax.servlet.ServletContext;
import org.springframework.web.context.ServletContextAware;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

/**
 * <pre>
 * egovframework.cmmn.web
 * SACContentPaginationRenderer.java
 * </pre>
 *
 * @Author   : 占쏙옙占쏙옙占쏙옙
 * @Date     : 2015. 11. 10.
 * @Version  :
 */
public class ContentPaginationRenderer extends AbstractPaginationRenderer
		implements ServletContextAware {
	private ServletContext servletContext;

	public ContentPaginationRenderer() {
		// no-op
	}

	/** PaginationRenderer.
	*
	* @see 개발프레임웍크 실행환경 개발팀
	*/
	public void initVariables() {
		/*
		 <li><a href="#">&lt; &lt;</a></li>
			<li><a href="#">&lt;</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">6</a></li>
			<li><a href="#">7</a></li>
			<li><a href="#">8</a></li>
			<li><a href="#">9</a></li>
			<li><a href="#">10</a></li>
			<li><a href="#">&gt;</a></li>
			<li><a href="#">&gt; &gt;</a></li>
		 */

		firstPageLabel = "<li class=\"first\"><a href=\"javascript:{0}({1})\" ></a></li>";
		previousPageLabel = "<li class=\"prev\"><a href=\"javascript:{0}({1})\" title=\"Go to prev page\"></a></li>";
		currentPageLabel = "<li class=\"on\"><a href=\"javascript:{0}\">{0}</a></li>";
		otherPageLabel = "<li><a href=\"javascript:{0}({1})\" title=\"Go to page 2\">{2}</a></li>";
		nextPageLabel = "<li class=\"next\"><a href=\"javascript:{0}({1})\" title=\"Go to next page\"></a></li>";
		lastPageLabel = "<li class=\"last\"><a href=\"javascript:{0}({1})\" title=\"Go to last page\" ></a></li>";		
		
	}


	/* (non-Javadoc)
	 * @see org.springframework.web.context.ServletContextAware#setServletContext(javax.servlet.ServletContext)
	 */
	@Override
	public void setServletContext(ServletContext servletContext) {
		// TODO Auto-generated method stub
		this.servletContext = servletContext;
		initVariables();
	}



}
