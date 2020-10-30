import React from 'react'
import {View, Text} from 'react-native'
import UneAction from './UneAction'


const ListeActions = ({actions}) => {

    return (
        <View>
            {Object.keys(actions).map(function(key) {
                return (
                    <UneAction action = {actions[key]}/>
                );
            })}
        </View>
    )
}

export default ListeActions