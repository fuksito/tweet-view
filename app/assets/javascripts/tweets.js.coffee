# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

load_more_tweets = (tweet_id)->
  return if $("#more_tweets").hasClass('disabled')
  max_id = $("#tweets_list .tweet:last").data('tweet-id')
  initial_button_text = $("#more_tweets").text()
  $("#more_tweets").addClass('disabled').text('Loading...')
  $.get '/tweets/fetch', {max_id : max_id}, (a) ->
    $("#tweets_list").append(a);
    $("#more_tweets").removeClass('disabled').text(initial_button_text)

refresh_tweets = ->
  return if $("#refresh").hasClass('disabled')
  since_id = $("#tweets_list .tweet:first").data('tweet-id')
  $("#refresh").addClass('animated').addClass('disabled')
  $.get '/tweets/fetch', {since_id: since_id}, (a) ->
    $("#tweets_list").prepend(a)
    $("#refresh").removeClass('animated').removeClass('disabled')

toggle_favorite = ->
    tweet_holder = $(this).parents('.tweet')
    tweet_id = tweet_holder.data('tweet-id')
    $('.star', tweet_holder).addClass('animated').addClass('disabled')
    $.post '/tweets/toggle_favorite', {tweet_id: tweet_id }, (result) ->
      tweet_holder.toggleClass('favorite')
      $('.star', tweet_holder).removeClass('animated').removeClass('disabled')
      if ( $("#tweets_list").hasClass('favorites_list') && !tweet_holder.hasClass('favorite'))
        tweet_holder.remove()

$(document).ready ->
  $("#more_tweets").click(load_more_tweets)
  $("#refresh").click(refresh_tweets)
  $(document).on 'click', '.tweet .star', toggle_favorite