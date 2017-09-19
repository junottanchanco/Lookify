package com.codingdojo.lookify.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.lookify.models.Song;
import com.codingdojo.lookify.services.SongService;

@Controller
public class Songs {
	
	private final SongService songService;
	
	public Songs(SongService songService) {
		this.songService = songService;
	}
	
	@RequestMapping("/")
	public String index() {
		return "index.jsp";
	}
	
	@RequestMapping("/dash")
	public String dashboard(Model model) {
//		model.addAttribute("song", new Song());
		List<Song> songs = songService.allSongs();
		model.addAttribute("songs",  songs);
		return "Dashboard.jsp";
	}
	
	@RequestMapping("/songs/new")
	public String newSong(@ModelAttribute("newSong") Song song) {
		return "addSong.jsp";
	}
	
	@PostMapping("/songs/new")
	public String createSong(@Valid @ModelAttribute("song") Song song, BindingResult result) {
		if(result.hasErrors()) {
			return "addSong.jsp";
		}else {
			songService.addSong(song);
			return "redirect:/dash";
		}
	}
	
	@RequestMapping("/songs/{id}")
	public String findSongById(Model model, @PathVariable("id") Long id) {
		model.addAttribute("song", songService.findSongById(id));
		return "showSong.jsp";
	}
	
	@RequestMapping("/songs/show/{id}")
	public String showSong(Model model, @PathVariable("id") Long id) {
		model.addAttribute("song", songService.findSongById(id));
		return "showSong.jsp";
	}
	
	@RequestMapping("/songs/delete/{id}")
	public String deleteSong(@PathVariable("id") Long id) {
		songService.deleteSong(id);
		return "redirect:/dash";
	}
	
	@RequestMapping("/songs/topTen")
	public String topTen(Model model) {
		List<Song> songs = songService.getTopSongs();
		model.addAttribute("songs", songs);
		return "topTen.jsp";
	}
	
	@PostMapping("/search")
	public String search(@RequestParam("artist") String artist) {
		return "redirect:/search/"+artist;
	}
	
	@RequestMapping("/search/{artist}")
	public String searchSong(Model model, @PathVariable("artist") String artist) {
		List<Song> songs = songService.getSearchSongs(artist);
		model.addAttribute("artist", artist);
		model.addAttribute("songs", songs);
		return "search.jsp";
	}
}
