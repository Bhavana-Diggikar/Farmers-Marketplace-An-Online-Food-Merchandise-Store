import React, { useState } from "react";
import userServices from "../../Services/user.services";
import toast from "react-hot-toast";

function AddToCart({ productId }) {

    const [showCartBox, setShowCartBox] = useState(false);
    const [qty, setQty] = useState("");

    const addMe = (e) => {
        e.preventDefault();

        // ✅ Validation
        if (!qty || qty < 1) {
            toast.error("Please select at least 1 quantity", {
                position: "bottom-right",
            });
            return;
        }

        const formdata = new FormData();
        formdata.append("qty", qty);

        userServices.addToCart(productId, formdata)
            .then((response) => {
                toast.success("Product Added to Cart!", {
                    position: "bottom-right",
                    style: {
                        borderRadius: "10px",
                        background: "#333",
                        color: "#fff",
                        height: "50px",
                        fontSize: "15px",
                    },
                });
                setShowCartBox(false);
                setQty("");
            })
            .catch((error) => {
                toast.error("Something went wrong!");
                console.error(error);
            });
    };

    return (
        <div>
            {showCartBox ? (
                <form onSubmit={addMe}>
                    <div className="row align-items-center">
                        <div className="col-4">
                            <input
                                type="number"
                                className="form-control form-control-sm"
                                min="1"
                                value={qty}
                                onChange={(e) => setQty(Number(e.target.value))}
                                placeholder="Qty"
                                style={{ width: "4rem" }}
                            />
                        </div>
                        <div className="col">
                            <button className="btn btn-primary btn-sm" type="submit">
                                Add To Cart
                            </button>
                        </div>
                    </div>
                </form>
            ) : (
                <button
                    type="button"
                    className="btn btn-primary"
                    onClick={() => setShowCartBox(true)}
                >
                    Buy Product
                </button>
            )}
        </div>
    );
}

export default AddToCart;
