class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def cart_total_amount
    LineItem.where(cart_id: current_cart.id).sum('amount')
  end
  helper_method :cart_total_amount

  def cart_price(id)
    line_item = LineItem.find(id)
    discounts = Discount.where('date_start <= ? and date_end>= ? and specification = ?', DateTime.now.to_date, DateTime.now.to_date, 0 )
    sum = line_item.product.price * line_item.amount
    discounts.each do |d|
      if (   (line_item.product_id == d.product_id) ||
          ( !(d.variety_id.nil?) && (d.product_id.nil?) && (line_item.product.variety_id == d.variety_id) ) ||
          (  (d.variety_id.nil?) && (d.product_id.nil?) && (line_item.product.variety.type_id == d.type_id ) ) )
        if d.percent == 0
          sum -= d.discount
        else
          sum -= sum*d.discount/100
        end
      end
      if d.amount >= line_item.amount

      end
    end
    sum
  end
  helper_method :cart_price

  def cart_total_price
    line_items = LineItem.where(cart_id: current_cart)
    sum = 0
    line_items.each do |line_item|
      sum += cart_price(line_item.id)
    end
    discounts = Discount.where('date_start <= ? and date_end>= ? and specification = ?', DateTime.now.to_date, DateTime.now.to_date, 1 )
    line_items.each do |l|
      discounts.each do |d|
        if (   (l.product_id == d.product_id) ||
            ( !(d.variety_id.nil?) && (d.product_id.nil?) && (l.product.variety_id == d.variety_id) ) ||
            (  (d.variety_id.nil?) && (d.product_id.nil?) && (l.product.variety.type_id == d.type_id ) ) )
          if d.percent == 0
            sum -= d.discount
          else
            sum -= sum*d.discount/100
          end
        end
      end
    end
    ((sum*1000).to_i).to_f/1000
  end
  helper_method :cart_total_price

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

end
