package com.example.movieproject.composable

import android.graphics.Bitmap
import android.graphics.drawable.Drawable
import androidx.compose.Composable
import androidx.compose.FrameManager
import androidx.compose.state
import androidx.ui.core.ContextAmbient
import androidx.ui.core.Modifier
import androidx.ui.foundation.Image
import androidx.ui.graphics.ImageAsset
import androidx.ui.graphics.asImageAsset
import com.bumptech.glide.Glide
import com.bumptech.glide.request.target.CustomTarget
import com.bumptech.glide.request.transition.Transition


@Composable
fun GlideImage(url: String?, imageModifier: Modifier = Modifier) {
    val image = state<ImageAsset?> { null }

    val target = object : CustomTarget<Bitmap>() {
        override fun onLoadCleared(placeholder: Drawable?) {
            image.value = null
        }

        override fun onResourceReady(resource: Bitmap, transition: Transition<in Bitmap>?) {
            FrameManager.framed {
                image.value = resource.asImageAsset()
            }
        }
    }

    Glide.with(ContextAmbient.current)
        .asBitmap()
        .load(url)
        .into(target)

    val theImage = image.value
    if (theImage != null) {
        Image(asset = theImage, modifier = imageModifier)
    }
}