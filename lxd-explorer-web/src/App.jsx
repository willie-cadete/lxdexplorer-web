import React from 'react';
import Header from './components/Header';
import Table from './components/Table';
import Footer from './components/Footer';
import { fetchContainers } from './api';

const containers = await fetchContainers();

function App() {

  return (
    <>
      <Header />
      <Table containers={containers} />
      <Footer />
    </>
  )
}

export default App
