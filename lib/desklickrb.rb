require "desklickrb/version"
require 'optparse'
require 'flickr.rb'
require 'fileutils'

module Desklickrb

  def filename
    @filename ||= "/tmp/desklickrb.jpg"
  end

  def flickr
    unless @flickr
      raise 'API Key must be created at https://www.flickr.com/services/apps/create/' unless @api_key
      @flickr = Flickr.new(@api_key)
    end
    @flickr
  end

  def choose_photo
    if @tag
      puts "picking up a photo by a tag #{@tag}" if @verbose
      photos = flickr.tag(@tag)
    elsif @user_id
      puts "picking up a photo of a user #{@user_id}" if @verbose
      abort "unknown user: #{@user_id}" unless user = flickr.users(@user_id)
      photos = user.photos
    else
      puts "picking up a photo from interestingness" if @verbose
      photos = flickr.photos_request('interestingness.getList')
    end

    return nil if photos.size < 1

    # find photo by random
    index = [*0..(photos.size-1)].sample
    photo = photos[index]
    puts "chosen photo index=#{index} of #{photos.size}" if @verbose

    # find maximum
    max_size = nil
    photo.sizes.each do |size|
      max_size = size if max_size == nil || max_size['width'].to_i < size['width'].to_i
    end
    puts "chosen photo size is #{max_size['width']} x #{max_size['height']}" if @verbose
    max_size
  end

  def write_file(size)
    puts "downloading image file to #{filename}" if @verbose
    file = Net::HTTP.get_response(URI.parse(size['source'])).body
    open(filename, 'w') do |io|
      io.puts file
    end
  end

  def apply_desktop_picture

    puts "applying desktop picture to #{filename}" if @verbose

    # set desktop picture with another filename because Dock does not change
    # the picture of the same filename with previous.
    another_file = filename + ".jpg"
    FileUtils.cp(filename, another_file)

script =<<EOS
tell application "System Events"
  set picture of every desktop to "#{another_file}"
  set picture of every desktop to "#{filename}"
end tell
EOS

# 2015/07/13: osascript がこんなエラーを出すので 2>&1 した。
# osascript: OpenScripting.framework - scripting addition "/Library/ScriptingAdditions/LCC
# Scroll Enhancer Loader.osax" cannot be used with the current OS because it has no OSAXHandlers
# entry in its Info.plist.
    IO.popen("/usr/bin/osascript > /dev/null 2>&1", "r+") {|io| io.puts script }
  end
end

include Desklickrb
@api_key = "77a6d216ed95e769e58235e942f39bc9"
@filename = "/Users/fukuda/Pictures/desklickrb.jpg"
abort "no photos" unless size = choose_photo
write_file(size)
apply_desktop_picture
