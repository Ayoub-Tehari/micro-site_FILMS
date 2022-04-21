class Films extends React.Component {
    render () {
        return (
            <div>
                <img src="http://localhost/test/logo3.jpg" class="logo" width ="10%" />
                <h1>composant REACT</h1>
            </div>
        )
    }
}
const domContainer = document.querySelector("#composant_react_1");
ReactDOM.render(<Films />,domContainer);