package com.pick.common.tiles;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

@Configuration
public class TilesConfig {
	@Bean
	public TilesConfigurer tilesConfigurer() {
		final TilesConfigurer configurer = new TilesConfigurer();
		configurer.setDefinitions(new String[] {"WEB-INF/tiles/tiles_main.xml","WEB-INF/tiles/tiles_member_mypage.xml","WEB-INF/tiles/tiles_business_mypage.xml","WEB-INF/tiles/tiles_admin_mypage.xml","WEB-INF/tiles/tiles_member_cart.xml","WEB-INF/tiles/tiles_goods.xml","WEB-INF/tiles/tiles_member.xml","WEB-INF/tiles/tiles_board.xml","WEB-INF/tiles/tiles_member_order.xml"});
		configurer.setCheckRefresh(true);
		return configurer;
		}
	@Bean
	public TilesViewResolver tilesViewResolver() {
		final TilesViewResolver resolver = new TilesViewResolver();
		resolver.setViewClass(TilesView.class);
		return resolver;
	}
}
