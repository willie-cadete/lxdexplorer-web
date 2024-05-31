
const getApiUrl = () => {
    const config_api_url = import.meta.env.VITE_API_URL;

    if (!config_api_url) {
        return `${window.location}api/v1/containers`;
    }

    return config_api_url;
}

const API_URL = getApiUrl();

export const fetchContainers = async () => {
    const response = await fetch(API_URL);
    const data = await response.json();
    return data;
}
