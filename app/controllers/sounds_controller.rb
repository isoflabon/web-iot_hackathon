class SoundsController < ApplicationController
  $now_sound
  def recieve_and_inspect
    # ここでサウンドを特定
    @sound = Sound.find_by(name: $now_sound)
    @request_id = params[:request_id].to_i
    if @request_id == 1
      @sound.effect_count = @sound.effect_count ? @sound.effect_count + 1 : 1
      @sound.save
    elsif @request_id == 0
      @sound.effect_count = @sound.effect_count ? @sound.effect_count - 1 : 1
      @sound.save
    end
  end

  def get_sound
    sounds = Sound.all
    sounds = sounds.sort_by{ |sound| sound.use_count}
    # soundsのデータの参照回数、効果を示す回数によって分岐させる
    # 参照回数が0のものから。なければ効果が高いものから。
    if sounds.first != nil
      if sounds.first.use_count == nil
        sound = sounds.first
        @sound_name = sound.name
        $now_sound = @sound_name
        # soundが nil だったら1を代入
        sound.use_count = sound.use_count ? sound.use_count + 1 : 1
        sound.save
      else
        sounds = sounds.sort_by{ |sound| sound.effect_count}
        sound = sounds.first
        @sound_name = sound.name
        $now_sound = @sound_name
        sound.use_count = sound.use_count ? sound.use_count + 1 : 1
        sound.save
      end
      redirect_to "http://def017ef.ngrok.io/#{@sound_name}"
    end
  end

  # todo: view側からユーザが音源を保存できるようにする
  # mp3以外のファイルは受け付けないようにする
  def sound_new
  end
end
