@SettingsUI = flight.component ->
  @attributes
    spero_discount_mark: '#spero_discount_mark'

   @updateDiscounts  = ->
    #  0 - disabled
    #  1 - enabled
    # -1 - undefined
    spero_discount_flag = -1

    for currency, account of @accounts
      #console.log(account)
      if account.currency == 'spero' && account.hasOwnProperty('spero_discount')
        #console.log(account.currency, account.spero_discount)
        if account.spero_discount == true
          spero_discount_flag = 1
        if account.spero_discount == false
          spero_discount_flag = 0

    spero_discount_mark_node = @select('spero_discount_mark')
    #console.log(@select('spero_discount_mark'))
    if spero_discount_flag == 1
      #console.log("turning ON")
      spero_discount_mark_node.attr('class', 'fa fa-star')
      spero_discount_mark_node.attr('style', 'color: #e6b800')
    else if spero_discount_flag == 0
      #console.log("turning OFF")
      spero_discount_mark_node.attr('class', '_empty')
      spero_discount_mark_node.attr('style', '_empty')

    #console.log gon.current_user

  @after 'initialize', ->
    @accounts = gon.accounts

    @on document, 'account::update', (event, data) =>
      @accounts = data
      @updateDiscounts()

    @on document, 'market::tickers', (event, data) =>
      @tickers = data.raw
      @updateDiscounts()

