package com.example.movieproject.ui

import androidx.ui.graphics.Color
import androidx.ui.text.TextStyle
import androidx.ui.text.font.FontFamily
import androidx.ui.text.font.FontStyle
import androidx.ui.text.font.FontWeight
import androidx.ui.unit.sp

const val posterURL = "https://image.tmdb.org/t/p/w500"
const val backDropURL = "https://image.tmdb.org/t/p/w1280"
const val apiKey = "4a01a777bc601f84dc9c862d70bea3fb"
const val baseURL = "https://api.themoviedb.org/3/movie/"

val bodyBold = TextStyle(
    fontWeight = FontWeight.Bold,
    fontSize = 16.sp,
    color = white
)

val bodyItalics = TextStyle(
    fontStyle = FontStyle.Italic,
    fontSize = 16.sp,
    color = white
)