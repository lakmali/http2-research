package com.rest.compress.sample;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.HttpHeaders;
import javax.ws.rs.core.Response;

@Path("users")
public class HeadersRestService {
	
	@GET
	public Response getImage(@Context HttpHeaders headers) throws InterruptedException {   
		for(String header : headers.getRequestHeaders().keySet()){
			System.out.println(header);
		}
		return Response.status(200).entity("OK").build();
	}

}
