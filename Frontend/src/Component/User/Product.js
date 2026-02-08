function Product({ product }) {
  return (
    <div className="col-sm-6 col-md-4 col-lg-3 mb-4">
      <div className="card product-card shadow-sm">

        <div className="product-image-wrapper">
          <img
            src={`http://localhost:8080/FarmersMarketplace/admin/${product.id}`}
            className="card-img-top"
            alt={product.stockItem}
          />
        </div>

        <div className="card-body d-flex flex-column text-center">
          <h6 className="card-title text-truncate">
            {product.stockItem}
          </h6>

          <button className="btn btn-primary btn-sm mt-auto">
            Add to Cart
          </button>
        </div>

      </div>
    </div>
  );
}

export default Product;
