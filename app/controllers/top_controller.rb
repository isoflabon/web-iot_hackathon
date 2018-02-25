class TopController < ApplicationController
  # 音源の効果を可視化する
  def index
    @sounds = Sound.all
  end

  def sound_new
    @upload_file = UploadFile.new( params.require(:upload_file).permit(:name, :file) )
    @upload_file.save
    redirect_to action: 'index'
  end

  def get_distance
    if 0 < params[:distance].to_i && params[:distance].to_i < 100
      @distance = Distance.new(distance: params[:distance])
      @distance.save
    end
    redirect_to "/distance/index"
  end

  def index_distance
    @distances = Distance.all.order(created_at: :desc)
  end
end
