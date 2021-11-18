class SearchsController < ApplicationController

  def search
    @model = params["model"] # 選択したmodelの値を@modelに代入。
    @content = params["content"] # 選択したmodelの値を@contentに代入。
    @method = params["method"] # 選択したmodelの値を@methodに代入。
    @records = search_for(@model, @content, @method).order(created_at: :desc)
  end

  private
  def search_for(model, content, method)
    model == 'hobby'
    if method == 'perfect'
      Hobby.where(name: content)
    else
      Hobby.where('name LIKE ?', '%'+content+'%')
    end
  end

end
