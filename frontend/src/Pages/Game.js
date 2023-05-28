import {Box, Container, ImageList, ImageListItem, ThemeProvider, Typography} from "@mui/material";
import {useEffect, useState} from "react";
import axios from "axios";
import {useParams} from "react-router-dom";

const Game = (props) => {
    const [loaded, setLoaded] = useState(false)
    const [game, setGame] = useState({
        gameId: 0,
        name: "defaultName",
        series: "defaultSeries",
        releaseDate: "defaultReleaseDate",
        description: "defaultDescription",
        tags: [],
        screenshots: [],
        publisher: "defaultPublisher",
    })
    const {id} = useParams()

    useEffect(() => {
        axios.get(`http://localhost:8080/games/getById/${id}`)
            .then(res => {
                setGame(res.data)
                setLoaded(true)
                console.log(res.data)
            })
            .catch(err => console.log(err))
    })

    return loaded ?
        (
            <Container>
                <ThemeProvider theme={props.theme}>
                    <Box sx={{display: 'flex', flexDirection: 'row'}}>
                        <Box sx={{display: 'flex', flexDirection: 'column'}}>
                            <Typography variant='h2'>
                                {game.name}
                            </Typography>
                            <Typography variant='h4'>
                                {game.series}
                            </Typography>
                            <ImageList sx={{ width: 500, height: 450 }} cols={3} rowHeight={164}>
                                {game.screenshots.map((item) => (
                                    <ImageListItem key={item}>
                                        <img
                                            src={`${item}?w=164&h=164&fit=crop&auto=format`}
                                            srcSet={`${item}?w=164&h=164&fit=crop&auto=format&dpr=2 2x`}
                                            alt={item}
                                            loading="lazy"
                                        />
                                    </ImageListItem>
                                ))}
                            </ImageList>
                        </Box>
                        <Box sx={{display: 'flex', flexDirection: 'column'}}>
                            <Typography variant='h5'>
                                Publisher: {game.publisher}
                            </Typography>
                            <Typography variant='h5'>
                                Release Date: {game.releaseDate}
                            </Typography>
                            <Typography variant='h5'>
                                Tags: {game.tags.map((tag) => (
                                    <>
                                        {tag} /
                                    </>
                                ))}
                            </Typography>
                        </Box>
                    </Box>
                </ThemeProvider>
            </Container>
        ) : (
            <h1>Loading...</h1>
        )
}

export default Game