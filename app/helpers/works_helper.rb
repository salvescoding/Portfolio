module WorksHelper
  def image_generator(*args)
    "http://placehold.it/#{args[0][:height]}x#{args[0][:width]}"
  end

  def portfolio_image(img, type)
    if img.model.main_image? || img.model.thumb_image?
      img
    elsif type == 'thumb'
      image_generator(height: '356', width: '200')
    else
      image_generator(height: '600', width: '350')
    end
  end
end
