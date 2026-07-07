
#' 处理逻辑
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#' @param dms_token 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' EdiSalOrderViewServer()
EdiSalOrderViewServer <- function(input,output,session,dms_token,erp_token) {
  #获取参数

  text_EdiSalOrder_FBillNO = tsui::var_text('text_EdiSalOrder_FBillNO')

  text_EdiSalOrder_FBillNO_delete = tsui::var_text('text_EdiSalOrder_FBillNO_delete')

  text_EdiSalOrder_FDate_delete = tsui::var_text('text_EdiSalOrder_FDate_delete')





  shiny::observeEvent(input$btn_EdiSalOrder_view,{
    FBillNO=text_EdiSalOrder_FBillNO()


    data = mdlEdiSalesOrderPkg::EdiSalOrder_view(erp_token =erp_token ,FBillNO=FBillNO)

    tsui::run_dataTable2(id ='EdiSalOrder_resultView' ,data = data)

    tsui::run_download_xlsx(id = 'dl_EdiSalOrder',data =data ,filename ='销售订单.xlsx' )



  })

  shiny::observeEvent(input$btn_EdiSalOrder_delete,{
    FBillNO=text_EdiSalOrder_FBillNO_delete()
    FDate =text_EdiSalOrder_FDate_delete()


    mdlEdiSalesOrderPkg::EdiSalOrder_delete(erp_token =erp_token ,FBillNO=FBillNO,FDate = FDate)

    tsui::pop_notice("删除成功")


  })



}


#' 处理逻辑
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#' @param dms_token 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' EdiSalOrderServer()
EdiSalOrderServer <- function(input,output,session,dms_token,erp_token) {
  EdiSalOrderViewServer(input = input,output = output,session = session,dms_token = dms_token,erp_token=erp_token)

}
