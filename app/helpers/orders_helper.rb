module OrdersHelper
  def display_order(order, status)
    ddc = order.created_at.strftime("%d/%m/%Y")
    dlt = order.drug.delivery_time
    processing_days = 1 # délai de traitement de la commande
    shipping_days = dlt + processing_days # délai total de livraison
    shipping_date = (order.created_at + shipping_days.days).strftime("%d/%m/%Y")

    if order.status == status
      content_tag :div, class: "order_show col-4 #{order.status}" do
        concat content_tag(:h1, "Order ##{(rand()*1000000).to_i} - #{order.id}")
        concat content_tag(:p, "NOM : #{order.drug.name}")
        concat content_tag(:p, "####################################")
        concat content_tag(:p, "DEALER : #{order.drug.user.username}")
        concat content_tag(:p, "STATUT DE LA COMMANDE : #{order.status}")
        concat content_tag(:br)
        concat content_tag(:p, "DATE DE COMMANDE : #{ddc}")
        concat content_tag(:p, "CATEGORY : #{order.drug.category}")
        concat content_tag(:p, "####################################")
        concat content_tag(:p, order.drug.description)
        concat content_tag(:p, "####################################")
        concat content_tag(:p, "DATE DE RECEPTION : #{shipping_date}")
        concat content_tag(:p, "####################################")
        concat content_tag(:p, "MONTANT : ")
        concat content_tag(:p, "#{order.drug.price}€", class: "price")
        if current_user.role == "buyer"
          if order.status == "pending"
            concat render(partial: "orders/actions_btn", locals: {order: order, delete: true})

          end
        elsif current_user.role == "seller" || current_user.role == "admin"
          if current_user.id == order.drug.user.id || current_user.role == "admin"
            if order.status == "pending"
              concat render(partial: "orders/actions_btn", locals: {order: order, delete: false})
            end
          end
        end
      end
    end
  end
end
