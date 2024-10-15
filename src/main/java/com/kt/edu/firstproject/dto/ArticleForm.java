package com.kt.edu.firstproject.dto;


import com.kt.edu.firstproject.entity.Article;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ArticleForm {
    private Long id;
    private String title;
    private String content;

    public Article toEntity() {
        return new Article(id, title, content);
    }
}
