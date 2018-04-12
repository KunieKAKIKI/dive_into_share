module FlashHelper
  def flash_class(key)
    if key == 'notice'
      'alert alert-info alert-dismissible fade show my-3'
    elsif key == 'alert'
      'alert alert-danger alert-dismissible fade show my-3'
    end
  end
end
