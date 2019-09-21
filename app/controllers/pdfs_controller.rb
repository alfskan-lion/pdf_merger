class PdfsController < ApplicationController
  def index
    @pdfs = Pdf.all
  end
  
  def new
    @pdf = Pdf.new
  end
  
  def create
    @pdf = Pdf.new(pdf_params)
    
      if @pdf.save
         redirect_to merge_path(@pdf.id), notice: "The pdf has been combined."
      else
         render :new
      end
  end
  
  def merge
    pdf = CombinePDF.new
    pdf << CombinePDF.load("public/uploads/pdf/pdf/#{params[:id]}/file1.pdf") 
    pdf << CombinePDF.load("public/uploads/pdf/pdf/#{params[:id]}/file2.pdf")
    pdf.save "public/uploads/pdf/pdf/#{params[:id]}/combined.pdf"
    redirect_to download_path(params[:id]), notice: "The pdf has been combined."
  end
  
  def download
    @id = params[:id]
  end
  
  def download_pdf
    send_file(
    "public/uploads/pdf/pdf/#{params[:id]}/combined.pdf",
    filename: "combined.pdf",
    type: "application/pdf"
    )
  end
  
  def destroy
  end
  
  private
      def pdf_params
        params.require(:pdf).permit({pdf: []})
      end
end
