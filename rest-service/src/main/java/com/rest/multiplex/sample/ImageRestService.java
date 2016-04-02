package com.rest.multiplex.sample;

import java.io.InputStream;

import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.ResponseBuilder;

@Path("images")
public class ImageRestService {
    
    @GET
	@Path("{name}")
	@Produces("image/png")
	public Response getImage(@PathParam("name") String name, @Context HttpServletResponse servletResponse) throws InterruptedException {   
    	//Thread.sleep(2);
    	InputStream in = this.getClass().getClassLoader().getResourceAsStream(name);
		ResponseBuilder response = Response.ok((Object) in);
		servletResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		return response.build();
	}

}
