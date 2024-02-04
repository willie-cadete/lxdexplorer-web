import React from 'react';

const Table = ({ containers }) => {
    return (
        <div>
            <table className="centered responsive-table highlight">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Host</th>
                        <th>Name</th>
                        <th>Status</th>
                        <th>IP</th>
                        <th>CIDR</th>
                        <th>OS</th>
                        <th>Version</th>
                        <th>Image ID</th>
                    </tr>
                </thead>
                <tbody>
                    {containers.map((container, index) => (
                        <tr key={index}>
                            <td>{index + 1}</td>
                            <td>{container.host}</td>
                            <td>{container.name}</td>
                            <td>{container.status}</td>
                            <td>{container.ip}</td>
                            <td>{container.cidr}</td>
                            <td>{container.os}</td>
                            <td>{container.version}</td>
                            <td>{container.imageid}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div >
    )
}

export default Table
