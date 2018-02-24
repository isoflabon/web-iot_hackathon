class TopController < ApplicationController
  # 音源の効果を可視化する
  def index
    @sounds = Sound.all
  end
end
