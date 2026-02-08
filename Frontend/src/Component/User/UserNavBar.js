import { useEffect, useState } from "react";
import { useNavigate, NavLink, Link } from "react-router-dom";

function UserNavBar() {
    const [loading, setLoading] = useState(false);
    const [user, setUser] = useState({});
    const navigate = useNavigate();

    useEffect(() => {
        const val = localStorage.getItem("user-token");
        if (val) {
            setUser(JSON.parse(val));
        }
    }, []);

    const logout = () => {
        setLoading(true);
        setTimeout(() => {
            localStorage.removeItem("user-token");
            setLoading(false);
            navigate("/");
        }, 2000);
    };

    if (loading) return null;

    const activeStyle = ({ isActive }) =>
        `nav-item nav-link fw-bolder myHover ${isActive ? "text-primary" : ""}`;

    return (
        <nav className="navbar navbar-expand-lg py-0" style={{ backgroundColor: "#e3f2fd" }}>
            <div className="container">

                {/* LOGO */}
                <Link to="/user" className="navbar-brand">
                    <img
                        src="https://img.freepik.com/free-vector/hand-drawn-farmers-market-logo_23-2149329270.jpg?w=2000"
                        height="50"
                        alt="Farmers Marketplace"
                    />
                </Link>

                <button
                    className="navbar-toggler"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#navbarCollapse"
                >
                    <span className="navbar-toggler-icon"></span>
                </button>

                <div className="collapse navbar-collapse" id="navbarCollapse">

                    {/* LEFT MENU */}
                    <div className="navbar-nav">

                        <NavLink to="/user/products" className={activeStyle}
                            style={{ letterSpacing: "4px" }}>
                            Products
                        </NavLink>

                        <NavLink to="/user/orders" className={activeStyle}
                            style={{ letterSpacing: "4px" }}>
                            Orders
                        </NavLink>

                        <NavLink to="/user/checkout" className={activeStyle}
                            style={{ letterSpacing: "4px" }}>
                            Cart
                        </NavLink>

                    </div>

                    {/* CENTER TITLE */}
                    <div className="navbar-nav mx-auto">
                        <span
                            className="nav-item nav-link fw-bolder text-black"
                            style={{ letterSpacing: "4px" }}
                        >
                            Farmers Marketplace
                        </span>
                    </div>

                    {/* USER NAME */}
                    <div className="navbar-nav">
                        <span
                            className="nav-item nav-link fw-bolder text-black"
                            style={{ letterSpacing: "4px" }}
                        >
                            Hello, {user?.firstname}
                        </span>
                    </div>

                    {/* PROFILE DROPDOWN */}
                    <div className="navbar-nav dropdown">
                        <button
                            className="nav-link btn btn-link"
                            data-bs-toggle="dropdown"
                        >
                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                                fill="currentColor" className="bi bi-person-circle"
                                viewBox="0 0 16 16">
                                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                                <path fillRule="evenodd"
                                    d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                            </svg>
                        </button>

                        <ul className="dropdown-menu dropdown-menu-dark">
                            <li>
                                <NavLink className="dropdown-item text-center" to="/user/profile">
                                    Profile
                                </NavLink>
                            </li>
                            <li>
                                <button className="dropdown-item text-center" onClick={logout}>
                                    Logout
                                </button>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>
        </nav>
    );
}

export default UserNavBar;
