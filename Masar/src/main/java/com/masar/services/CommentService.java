package com.masar.services;

import java.util.List;

import org.springframework.stereotype.Service;
import com.masar.models.Comment;
import com.masar.repository.CommentRepository;

@Service
public class CommentService {
	
	public final CommentRepository commentRepository;
	
	
	public CommentService(CommentRepository commentRepository) {
		super();
		this.commentRepository = commentRepository;
	}


	public Comment creatComment(Comment comment) {
		return commentRepository.save(comment);
	}
	
	public List<Comment> allComments(){
		return commentRepository.findAll();
	}

}
