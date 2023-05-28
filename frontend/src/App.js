import {BrowserRouter as Router, Routes, Route} from "react-router-dom";
import Game from "./Pages/Game";
import {createTheme} from "@mui/material";

const theme = createTheme({
    palette: {
        primary: {
            light: '#00695f',
            main: '#009688',
            dark: '#33ab9f',
            contrastText: '#fff',
        },
        secondary: {
            light: '#2a3eb1',
            main: '#3d5afe',
            dark: '#637bfe',
            contrastText: '#fff',
        },
    },
});

const App = () => {
    return (
        <Router>
            <Routes>
                <Route path='/game/:id' element={<Game theme={theme}/>}/>
            </Routes>
        </Router>
    )
}
export default App;
