package com.web.dao;

import com.web.entity.Film;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2016/9/27 0027.
 */
@Repository("FilmDAO")
public interface FilmDAO {
    public Film selectFilmFromId(int id);

    public List<Film> selectFilmFromFilmType(String film_type);

    public List<Film> selectFilmFromFilmStatus(int file_status,int num,int start);

    public Film selectFilmFromName(String name);

    public List<Film> selectFilmFromLang(String lang);

    public List<Film> selectAllFilmFromFilmStatus(int file_status);

    public List<Film> selectAll();

    public int insertFilm(Film film);

    public int deleteFilmFromId(int id);
    public int updateFilmFromId(Film film);
}
