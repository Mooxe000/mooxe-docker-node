import React from 'react'
import style from './index.module.scss'
export default function(props) {
    const [count, setCount] = React.useState(1)
    return (
        <div>
            hello world
            <button className={style.button} onClick={() => setCount(count + 1)}>
                count: {count}
            </button>
        </div>
    )
}