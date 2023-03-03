module OrdersHelper
  def display_order(order, status)
    ddc = order.created_at.strftime("%d/%m/%Y")
    dlt = order.drug.delivery_time
    processing_days = 1 # délai de traitement de la commande
    shipping_days = dlt + processing_days # délai total de livraison
    shipping_date = (order.created_at + shipping_days.days).strftime("%d/%m/%Y")

    if order.status == status
      content_tag :div, class: "order_show col-4" do
        concat content_tag(:h1, "Order ##{(rand()*1000000).to_i} - #{order.id}")
        concat content_tag(:p, "NOM : #{content_tag(:span, order.drug.name)}")
        concat content_tag(:p, "####################################")
        concat content_tag(:p, "DEALER : #{order.drug.user.username}")
        concat content_tag(:p, "STATUT DE LA COMMANDE : #{order.status}")
        concat content_tag(:br)
        concat content_tag(:p, "DATE DE COMMANDE : #{ddc}")
        concat content_tag(:p, "CATEGORY : #{content_tag(:span, order.drug.category)}")
        concat content_tag(:p, "####################################")
        concat content_tag(:p, order.drug.description)
        concat content_tag(:p, "####################################")
        concat content_tag(:p, "DATE DE RECEPTION : #{shipping_date}")
        concat content_tag(:p, "####################################")
        concat content_tag(:p, "MONTANT : ")
        concat content_tag(:p, content_tag(:span, "#{order.drug.price}€"), class: "price")

        if current_user.role == "buyer"
          if order.status == "pending"
            concat content_tag(:div, class: "order-button") do
              concat link_to("Annuler", order_path(order), method: :delete, class: "btn btn-danger")
            end
          end
        elsif current_user.role == "seller"
          if current_user.id == order.drug.user.id || current_user.role == "admin"
            if order.status == "pending"
              concat content_tag(:div, class: "order-button") do
                concat link_to("Approve order", approve_order_path(order), method: :patch, class: "btn btn-success")
                concat link_to("Decline order", decline_order_path(order), method: :patch, class: "btn btn-danger")
              end
            end
          end
        end
      end
    end
  end
end
