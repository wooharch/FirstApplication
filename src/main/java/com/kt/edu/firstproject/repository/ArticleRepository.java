package com.kt.edu.firstproject.repository;

import com.kt.edu.firstproject.entity.Article;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ArticleRepository extends JpaRepository<Article, Long> {

}
