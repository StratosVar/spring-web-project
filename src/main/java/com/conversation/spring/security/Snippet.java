//package com.conversation.spring.security;
//
//public class Snippet {
//	@Override
//	protected void configure(HttpSecurity http) throws Exception {              
//	
//	     http
//	     .authorizeRequests()
//	         .antMatchers("/", "/login","/loginError","/home","/interruption").permitAll()                                                          
//	         .antMatchers("/admin").hasAuthority(Roles.ROLE_PREFIX.role()+Roles.HALLEYYNT01.role())  
//	         .antMatchers("/requests").hasAuthority(Roles.ROLE_PREFIX.role()+Roles.CCHALLEYLOGIN.role())
//	         .antMatchers("/solrequests").hasAuthority(Roles.ROLE_PREFIX.role()+Roles.SOLHALLEYLOGIN.role())
//	         .anyRequest().authenticated()
//	         .and()
//	     .formLogin()             
//	         .loginPage("/login")  
//	         //.failureUrl("/loginError")
//	         .loginProcessingUrl("/authenticate")
//	         .defaultSuccessUrl("/")            
//	         .and()
//	     .logout().clearAuthentication(true).invalidateHttpSession(true).deleteCookies("JSESSIONID")         
//	         .logoutSuccessUrl("/login");
//	         //.and() 
//	     //.exceptionHandling().accessDeniedHandler(accessDeniedHandler);    
//	}   
//}

