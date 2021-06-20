class ItemsController < ApplicationController
  # リダイレクト処理？ パスを入力すれば、ログインしていなくても（新規投稿画面に）アクセスできてしまう

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :text, :category_id, :item_status_id, :delivery_fee_id, :prefecture_id, :delivery_period_id, :price).merge(user_id: current_user.id)
  end

end
