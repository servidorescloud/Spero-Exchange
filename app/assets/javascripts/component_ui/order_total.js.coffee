@OrderTotalUI = flight.component ->
  flight.compose.mixin @, [OrderInputMixin]

  @attributes
    precision: gon.market.bid.fixed
    variables:
      input: 'total'
      known: 'price'
      output: 'volume'

  @onOutput = (event, order) ->
    total = order.price.times order.volume

    @changeOrder @value unless @validateRange(total)
    @setInputValue @value

    @fee = 0.0
    @fee_actual_percent = 0.0

    if event.target.id == 'ask_entry'
      @fee = gon.market.ask.fee
    else
      @fee = gon.market.bid.fee

    @spero_discount_flag = -1

    for currency, account of gon.accounts
      if account.currency == 'spero' && account.hasOwnProperty('spero_discount')
        if account.spero_discount == true
          @spero_discount_flag = 1
        if account.spero_discount == false
          @spero_discount_flag = 0

    @fee_actual_percent = @fee
    if @spero_discount_flag == 1
      @fee_actual_percent = @fee / 2.0

    order.total = @value
    order.fee = @value * @fee
    order.fee_percent = @fee * 100.0
    order.fee_actual_percent = @fee_actual_percent * 100.0
    order.spero_discount_flag = @spero_discount_flag

    @trigger 'place_order::order::updated', order
    #console.log(order)
