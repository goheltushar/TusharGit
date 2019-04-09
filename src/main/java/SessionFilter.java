
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;

/**
 * Servlet Filter implementation class SessionFilter
 */

public class SessionFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public SessionFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest hsreq = (HttpServletRequest) request;
		HttpServletResponse hsres = (HttpServletResponse) response;
		PrintWriter out = hsres.getWriter();
		try {
			// TODO Auto-generated method stub

			// place your code here

			// pass the request along the filter chain

			HttpSession session = hsreq.getSession(false);

			if (null == session) {
				hsres.sendRedirect("/login/login.html");
			}

			if (hsreq.getServletPath().contains("processLogin"))
				chain.doFilter(request, response);
			
		} catch (Exception e) {
			hsres.sendRedirect("/login/login.html");
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
