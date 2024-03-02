import React from 'react'
import Table from './Table';
import { fetchContainers } from '../api';

const containers = await fetchContainers();

const Home = () => {
  return (
    <>
      <Table containers={containers.message} />
    </>
  )
}

export default Home
