package br.com.ases.interceptor;

import br.com.ases.controller.ErrorController;
import br.com.caelum.vraptor.InterceptionException;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.core.InterceptorStack;
import br.com.caelum.vraptor.interceptor.Interceptor;
import br.com.caelum.vraptor.ioc.RequestScoped;
import br.com.caelum.vraptor.resource.ResourceMethod;


@RequestScoped
@Intercepts
public class ExceptionInterceptor implements Interceptor {

	private Result result;
	
	public ExceptionInterceptor (Result result) {
		this.result = result;
	}
	public boolean accepts(ResourceMethod method) {
		return true;
	}

	public void intercept(InterceptorStack stack, ResourceMethod method, Object instance) throws InterceptionException {
		
		try {
            stack.next(method, instance);
            
        } catch (Exception e) {
        	result.include("error",e.getMessage());
        	result.forwardTo(ErrorController.class).index();
        	e.printStackTrace();
        }
		
	}

}
