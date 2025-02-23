package com.koreait.short_url_project_02.domain.article.repository;

import com.koreait.short_url_project_02.domain.article.entity.Article;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ArticleRepository extends JpaRepository<Article, Long> {

}
